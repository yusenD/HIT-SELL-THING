var mongoose = require('mongoose');
const Schema = mongoose.Schema;
const bcrypt = require('bcryptjs');

//mongoose.connect('mongodb://localhost/HitwhFleaMarket');
mongoose.connect("mongodb://localhost:27017/HitwhFleaMarket", {useNewUrlParser:true}, function(err){

　　if(err){

　　　　console.log('Connection Error:' + err)

　　}else{

　　　　console.log('Connection success!')

　　}

})
//用户数据表字段
const UserSchema = new Schema({
	user_ID:String,				//用户ID 主键
	user_name:String,			//用户名
	user_number:{				//账号
		type:String,
		unique:true,			//不可以重复约束
		require:true			//不可以为空约束
	}, 		
	user_password:{				//密码
		type:String,
		require:true
	},		
	user_portrait:String,		//头像
	user_phone:String,			//电话
	user_qq:String,				//QQ
	user_wechat:String,			//微信
	user_sex:String,			//性别
})

//物品数据表字段
const ProductSchema = new Schema({
	product_ID:String,          //物品id  主键
	product_name:String,		//物品标题
	product_description:String,
	owner_ID:String,			//拥有者ID 
	owner_name:String,          //拥有者名称
	product_kind:String,		//类别
	product_price:Number,		//价钱
	pub_Date:Date,			    //发布时间
	product_state:Boolean,		//状态
	buyer_ID:String,			//购买者ID
	buyer_name:String,          //购买者名称
	product_picture:Array, 	    // 一个元素为string(url)的List
	reply:[{						//回复 一个元素为dict的List
		time:Date,				//回复时间
		user_ID:String,			//回复者ID
		user_name:String,		//回复者用户名
		content:String,			//回复内容
	}],
	agreement:Number,			//赞
})

//添加用户保存时中间件对password进行bcrypt加密，保证只有用户本人知道密码
UserSchema.pre('save',function(next){
	var user = this;
	if(this.isModified('user_password') || this.isNew){
		bcrypt.genSalt(10,function(err,salt){
			if(err){
				return next(err);
			}
			bcrypt.hash(user.user_password,salt,function(err,hash){
				if(err){
					return next(err);
				}
				user.user_password=hash;
				next();
			});
		});
	}else{
		return next();
	}
});

//校验用户输入密码是否正确
UserSchema.methods.comparePassword = function(passw,cb){
	bcrypt.compare(passw,this.user_password,(err,isMatch) =>{
		if(err){
			return cb(err);
		}
		cb(null,isMatch);
	});
};


const db = {
    User: mongoose.model('users',UserSchema),
    Product: mongoose.model('products',ProductSchema),
}

module.exports = db;

var BZL = new db.User({
	user_ID:"123",				
	user_name:"bzl",			
	user_number:"123", 		
	user_password:"123456",		
	user_portrait:"asd",		
	user_phone:"1234",			
	user_qq:"12345",				
	user_wechat:"123456",			
	user_sex:"男",			
});

var ZXY = new db.Product({
	product_ID:"1234",          
	product_name:"String",		
	product_description:"String",
	owner_ID:"String",			 
	owner_name:"String",          
	product_kind:"String",		
	product_price:123,		
	pub_Date:"2013-02-22T03:03:37.312Z",			    
	product_state:1,		//状态
	buyer_ID:"String",			//购买者ID
	buyer_name:"String",          //购买者名称
	product_picture:'qew', 	    // 一个元素为string(url)的List
	reply:[{						//回复 一个元素为dict的List
		time:"2013-02-22T03:03:37.312Z",				//回复时间
		user_ID:"String1",			//回复者ID
		user_name:"String2",		//回复者用户名
		content:"String3",			//回复内容
	}],
	agreement:123,			//赞


})

ZXY.save();
BZL.save();
