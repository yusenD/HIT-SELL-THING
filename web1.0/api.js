const db = require('./db')
const bodyParser = require('body-parser');
const url = require("url");//解析url为对象
const md5 = require('md5-node');
const querystring = require('querystring');//解析如‘a=1&b=2’为对象 这传入的应该是一个字典
const session = require('espress-session');

module.exports = function (app) {
	app.use(bodyParser.json());
	app.use(bodyParser.urlencoded({ extended: false }));
	app.all("*", function (req, res, next) {
		next();
	});

	app.use(session({
		secret: 'sessiontest',
		resave: false,
		saveUninitialized: true
	}))

	//api 用户注册
	app.post('...', function (req, res) {
		if (!req.body.user_number || !req.body.user_password) {
			res.json({ code: 700, msg: '信息未输入完全！' });
			return
		} else {
			db.User.create(
				req.body,
				function (err, doc) {
					if (err) {
						console.log('注册失败' + err);
						res.json({ code: 700, msg: '注册失败' })
						return 
					} else {
						console.log(doc);
						res.json({ code: 200, msg: '成功创建新用户！' })
					}
				}
			)
		}
	});


	// api 用户登录
	app.get('...', function (req, res) {
		//登录数据进行验证
		var usernumber = req.body.user_number;
		var userpassword = req.body.user_password
		const param = {}
		param.user_number = usernumber
		//对比数据库中的信息
		db.User.find({ param},
			{__v: 0, user_password: 1}, function(err, doc) {
			//用户信息不存在时
			if(doc.length==0) {
				res.json({code: 700, msg: "用户信息不存在，请核对后进行登录！"});
				return;
			}
				if (md5(doc[0].user_password) == userpassword) {
					req.session.user_number = doc[0].user_number;
					res.json({ code: 200, msg: "登录成功", user_number: usernumber });
					return
				} else {
					//数据匹配失败，密码错误
					res.json({ code: 700, msg: "登录失败，密码输入错误请重新输入" });
					return
				}
			})
	}
	)

	// api 修改用户信息
	app.post('...', function (req, res) {
		console.log(req.body)
		db.User.findByIdAndUpdate(
			req.body._id,
			req.body,
			{ upsert: true },
			function (err, doc) {
				if (err) {
					console.log('修改账户信息错误：' + err);
					res.json({ code: 700, msg: '修改账户信息失败！' })
					return
				} else {
					res.json({ code: 200, msg: '修改成功' })
					
				}
			}
		)
	})

	//删除用户信息
	app.get('...', function (req, res) {
		db.User.findByIdAndRemove(
		req.query._id,
		function (err, doc) {
			if (err) {
				res.json({ code: 700, msg: '删除失败' })
				return 
			}
			else {
				res.json({ code: 200, msg: '修改成功' })
			}
		}
		)
	})

	//api 获取种类列表   在使用_id查询时 注意使用new ObjectId(id)来避免发生bug

	app.get('/hit_sell/kind', function (req, res) {
		let kindlist = []
		const getKind = new Promise((resolve, reject) => {
			db.kind.find(
			{},
			  { __v: 0 },
			  function (err, doc) {
			  	if (err) {
			  		console.log('kind get error!');
			  		reject('reject kind')
			  	} else {
			  		if (!doc) {

			  		} else {
			  			kindlist = doc;
			  		}
			  		resolve(kindlist)
			  	}
			  })
		})

		const se_promise = Promise.all([getKind])

		se_promise.then((suc) => {

			let data = {
				"kindlist": suc
			}
			res.json({ code: 200, msg: '种类列表获取成功', data: data })
			return
		}).catch((err) => {
			console.log('err all:' + err)
			res.json({ code: 404, msg: '种类列表获取失败', data: data })
			return
		})
	})

	//api 获取种类的具体数据

	app.get('/hit_sell/kinddata', function (req, res) {

		let kinddata = []
		let kind = req.query.kind
		const param = {}
		param.product_kind = kind

		if (!kind) {
			const getkinddata = new Promise((resolve, reject) => {
				db.Product.find(
				{ param},
					{__v: 0, _id: 1, product_name: 1, product_price: 1, owner_name: 1, pub_Date: 1, product_picture: 1},
				  function (err, doc) {
					if (err) {
					  console.log('kinddata get error!');
					  reject('reject kinddata')
				} else {
					  if (!doc) { 

            } else {
						kinddata = doc;
				}
					  resolve(kinddata)
				}
				}).limit(10)
			})
		} else {
			console.log("分类参数未识别")
			res.json({ code: 700, msg: "分类参数传递出错", data: kind })
			return
		}


		const kinddata_promise = Promise.all([getkinddata])

		kinddata_promise.then((suc) => {
			let data = {
				"kinddata": suc
			}
			res.json({ code: 200, msg: '分类数据获取成功', data: data })
			return
		}).catch((err) => {
			console.log('err all:' + err)
			res.json({ code: 600, msg: '分类数据获取失败', data: data })
			return
		})
	})

	//api 获取商品信息


	app.get('/hit_sell/product', function (req, res) {

		let productdata = []
		let id = req.query.id
		const param = {}
		param._id = new ObjectId(id)

		if (!kind) {
			const getproductdata = new Promise((resolve, reject) => {
				db.Product.find(
				{ param},
					{__v: 0},
				  function (err, doc) {
					if (err) {
					  console.log('productdata get error!');
					  reject('reject productdata')
				} else {
					  if (!doc) { 

            } else {
						productdata = doc;
				}
					  resolve(productdata)
				}
				}).limit(10)
				})
				} else {
				   console.log("商品id未识别")
				   res.json({code: 404, msg: "商品id传递出错", data: kind})
				   return
				}


		const productdata_promise = Promise.all([getproductdata])

		productdata_promise.then((suc) => {
			let data = {
				"productdata": suc
			}
			res.json({ code: 200, msg: '查询成功', data: data })
			return
		}).catch((err) => {
			console.log('err all:' + err)
			res.json({ code: 600, msg: '查询出错', data: data })
			return
		})
	})

	//api 添加评论
	app.post('/hit_sell/addreply', function (req, res) {
		console.log(req.body)
		if (!req.body.words) {
			db.Product.findByIdAndUpdate(
			 req.body._id,
			 req.body,
			 { upsert: true },
			 function (err, doc) {
			 	if (err) {
			 		console.log('修改错误：' + err);
			 		res.json({ code: 700, msg: '评论添加失败：' })
			 		return
			 	} else {
			 		res.json({ code: 200, msg: '评论添加成功' })
			 	}
			 }
		   )
		} else {
			res.json({ code: 700, msg: '评论不能为空！' })
			return
		}
	}
	 //api 

 )
}