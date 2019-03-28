const db = require('./db')
const bodyParser = require('body-parser');
const url = require("url");//解析url为对象
const querystring = require('querystring');//解析如‘a=1&b=2’为对象

module.exports = function (app) {
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({extended: false}));
  app.all("*", function (req, res, next) {
    next();
  });

  // api login
  app.get('/repair/app/login', function (req, res) {
    // 对发来的登录数据进行验证
    if (!req.query.account) {
      res.json({code: 600, msg:'name 不能为空！'})
      return
    }
    if (!req.query.password) {
      res.json({code: 600, msg:'pwd 不能为空！'})
      return
    }
    db.person.findOne(
      {account: req.query.account}, 
      function(err, doc){
      if (err) {
        console.log('查询出错：' + err);
      } else {
        if (!doc) {
          res.json({code: 700, msg:'不存在该用户'})
          return
        } else {
          if (req.query.password != doc.password) {
            res.json({code: 700, msg:'密码不正确'})
            return
          } else {
            res.json({code: 200, msg:'欢迎使用'})
            return
          }
        }

      }
    })
    // 查询数据库验证账号、密码
    // 返回登录状态
    // res.send(JSON.stringify({code: 200, data: {account: 'guojc', pass: 111111}}))
  })

  //维修列表================================================================================

  //获取维修列表————完成
  app.get('/repair/app/getrepairList', function (req, res) {
    
    let repairBean = [];
    const param = {};
    const time = {};
    if(req.query.center_name!=undefined) param.center_name = req.query.center_name;
    if(req.query.start_time!=undefined) {
      time.$gte = req.query.start_time;
      param.time = time;
    }
    if(req.query.end_time!=undefined) {
      time.$lte = req.query.end_time;
      param.time = time;
    }
    console.log(param)
    // repair
    const getrepairBean = new Promise((resolve, reject) => {
      db.repair.find(
        param,
        {__v:0},
        function (err, doc) {
          if (err) {
            console.log('repairBean find error!')
            reject('reject repairBean')
          } else {
            if (!doc) {
              repairBean = [];
            } else {
              repairBean = doc;
            }
            resolve(repairBean)
          }
        })
    })

    const p_all = Promise.all([getrepairBean])

    p_all.then((suc) => {
      let data = {
        "repairBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })
  })

  //删除维修记录————完成
  app.get('/repair/app/deleterepairRecord', function (req, res) {
      console.log(req.query)
      db.repair.findByIdAndRemove(
        req.query._id,
        function(err,doc){
          if(err){
            console.log(err)
            res.json({code:700,msg:'删除失败'})
          }else{
            res.json({code:200,msg:'删除成功'})
          }
        }
      )
  })

  //修改维修记录————完成
  app.post('/repair/app/changerepairRecord', function (req, res) {
    console.log(req.body)
    db.repair.findByIdAndUpdate(
      req.body._id,
      req.body,
      {upsert:true},
      function(err,doc){
        if (err) {
          console.log('修改错误：' + err);
          res.json({code: 700, msg:'修改失败：'})
          return
        } else{
          res.json({code: 200, msg:'修改成功'})
        }
      }
    )
  })

  //增加维修记录————完成
  app.post('/repair/app/addrepairRecord', function (req, res) {
    db.repair.create(
      req.body,
      function(err,doc){
        if(err){
          console.log('添加失败' + err);
          res.json({code: 700, msg:'添加失败'})
        } else{
          console.log(doc);
          res.json({code: 200, msg:'添加成功'})
        }
      }
    )

  })

  //安装记录=====================================================
  //获取安装列表————完成
  app.get('/repair/app/getInstallList', function (req, res) {
    
    let installBean = [];
    const param = {};
    const time = {};
    if(req.query.center_name!=undefined) param.center_name = req.query.center_name;
    if(req.query.start_time!=undefined) {
      time.$gte = req.query.start_time;
      param.time = time;
    }
    if(req.query.end_time!=undefined) {
      time.$lte = req.query.end_time;
      param.time = time;
    }
    console.log(param)
    // install
    const getInstallBean = new Promise((resolve, reject) => {
      db.install.find(
        param,
        {__v:0},
        function (err, doc) {
          if (err) {
            console.log('installBean find error!')
            reject('reject installBean')
          } else {
            if (!doc) {
              installBean = [];
            } else {
              installBean = doc;
            }
            resolve(installBean)
          }
        })
    })

    const p_all = Promise.all([getInstallBean])

    p_all.then((suc) => {
      let data = {
        "installBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })
  })

  //删除安装记录————
  app.get('/repair/app/deleteInstallRecord', function (req, res) {
      console.log(req.query)
      db.install.findByIdAndRemove(
        req.query._id,
        function(err,doc){
          if(err){
            console.log(err)
            res.json({code:700,msg:'删除失败'})
          }else{
            res.json({code:200,msg:'删除成功'})
          }
        }
      )
  })

  //修改安装记录————
  app.post('/repair/app/changeInstallRecord', function (req, res) {
    console.log(req.body)
    db.install.findByIdAndUpdate(
      req.body._id,
      req.body,
      {upsert:true},
      function(err,doc){
        if (err) {
          console.log('修改错误：' + err);
          res.json({code: 700, msg:'修改失败：'})
          return
        } else{
          res.json({code: 200, msg:'修改成功'})
        }
      }
    )
  })

  //增加安装记录————
  app.post('/repair/app/addInstallRecord', function (req, res) {
    db.install.create(
      req.body,
      function(err,doc){
        if(err){
          console.log('添加失败' + err);
          res.json({code: 700, msg:'添加失败'})
        } else{
          console.log(doc);
          res.json({code: 200, msg:'添加成功'})
        }
      }
    )

  })

  //人员管理=======================================
  //查询人员————完成
  app.get('/repair/app/getPersonList', function (req, res) {
    
    let personBean = [];
    const param = {};
    if(req.query.centerName!=undefined) param.center_name = req.query.centerName;
    console.log(param)
    // repair
    const getPersonBean = new Promise((resolve, reject) => {
      db.person.find(
        param,
        {__v:0},
        function (err, doc) {
          if (err) {
            console.log('personBean find error!')
            reject('reject personBean')
          } else {
            if (!doc) {
              personBean = [];
            } else {
              personBean = doc;
            }
            resolve(personBean)
          }
        })
    })

    const p_all = Promise.all([getPersonBean])

    p_all.then((suc) => {
      let data = {
        "personBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })
  })
  //增加人员————完成
  app.post('/repair/app/addPerson', function (req, res) {
    db.person.create(
      req.body,
      function(err,doc){
        if(err){
          res.json({code:700,msg:'添加失败'})
        }else{
          res.json({code:200, msg:'添加成功'})
        }
      }
      )
  })
  //删除人员————完成
  app.get('/repair/app/deletePerson', function (req, res) {
    db.person.findByIdAndRemove(
      req.query._id,
      function(err,doc){
        if(err){
          res.json({code:700,msg:'删除失败'})
        }else{
          res.json({code:200,msg:'删除成功'})
        }
      }
    )
  })
  //修改人员————完成
  app.post('/repair/app/changePerson', function (req, res) {
    console.log(req.body)
    db.person.findByIdAndUpdate(
      req.body._id,
      req.body,
      {upsert:true},
      function(err,doc){
        if (err) {
          console.log('修改错误：' + err);
          res.json({code: 700, msg:'修改失败：'})
          return
        } else{
          res.json({code: 200, msg:'修改成功'})
        }
      }
    )
  })

  //联社中心==========================================完成了！！！
  //获取联社中心列表--完成
  app.get('/repair/app/getCenterList', function (req, res) {
    let centerBean = [];

    // center
    const getCenter = new Promise((resolve, reject) => {
      db.center.find(
        {},
        {__v:0},
        function (err, doc) {
          if (err) {
            console.log('center find error!');
            reject('reject center')
          } else {
            if (!doc) {
              centerBean = [];
            } else {
              centerBean = doc;
            }
            resolve(centerBean)
          }
        })
    })

    const p_all = Promise.all([getCenter])

    p_all.then((suc) => {
      let data = {
        "CenterBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })

  })
  //删除中心记录————完成
  app.get('/repair/app/deleteCenterRecord', function (req, res) {
      db.center.findByIdAndRemove(
        req.query._id,
        function(err,doc){
          if(err){
            res.json({code:700,msg:'删除失败'})
          }else{
            res.json({code:200,msg:'删除成功'})
          }
        }
      )
  })
  //增加中心记录————完成
  app.get('/repair/app/addCenterRecord', function (req, res) {
    db.center.create(
      {center_name:req.query.center_name},
      function(err,doc){
        if(err){
          res.json({code:700,msg:'添加失败'})
        }else{
          res.json({code:200, msg:'添加成功'})
        }
      }
      )
  })

  //设备详细=====================================完成了！！！
  //查询设备详细————完成
  app.get('/repair/app/getDeviceList', function (req, res) {
    let deviceBean = [];

    const getDevice = new Promise((resolve, reject) => {
      db.device.find(
        {},
        function (err, doc) {
          if (err) {
            console.log('device find error!');
            reject('reject device')
          } else {
            if (!doc) {
              deviceBean = [];
            } else {
              deviceBean = doc;
            }
            resolve(deviceBean)
          }
        })
    })

    const p_all = Promise.all([getDevice])

    p_all.then((suc) => {
      let data = {
        "DeviceBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })

  })
  //增加设备详细————完成
  app.get('/repair/app/addDevice', function (req, res) {
    db.device.create(
      {device_name:req.query.device_name},
      function(err,doc){
        if(err){
          res.json({code:700,msg:'添加失败'})
        }else{
          res.json({code:200, msg:'添加成功'})
        }
      }
    )
  })
  //删除设备详细————完成
  app.get('/repair/app/deleteDevice', function (req, res) {
    db.device.findByIdAndRemove(
      req.query._id,
      function(err,doc){
        if(err){
          res.json({code:700,msg:'删除失败'})
        }else{
          res.json({code:200,msg:'删除成功'})
        }
      }
    )
  })

  //维修项目明细====================================完成了！！！
  //查询可选择的项目详细————完成
  app.get('/repair/app/getProjectList', function (req, res) {
    let projectBean = [];

    // project
    const getProject = new Promise((resolve, reject) => {
      db.project.find(
        {},
        function (err, doc) {
          if (err) {
            console.log('project find error!');
            reject('reject project')
          } else {
            if (!doc) {
              projectBean = [];
            } else {
              projectBean = doc;
            }
            resolve(projectBean)
          }
        })
    })

    const p_all = Promise.all([getProject])

    p_all.then((suc) => {
      let data = {
        "ProjectBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })

  })
  //增加项目详细————完成
  app.get('/repair/app/addProject', function (req, res) {
    db.project.create(
      {project_name:req.query.project_name},
      function(err,doc){
        if(err){
          res.json({code:700,msg:'添加失败'})
        }else{
          res.json({code:200, msg:'添加成功'})
        }
      }
      )
  })
  //删除设备详细————完成
  app.get('/repair/app/deleteProject', function (req, res) {
    db.project.findByIdAndRemove(
      req.query._id,
      function(err,doc){
        if(err){
          res.json({code:700,msg:'删除失败'})
        }else{
          res.json({code:200,msg:'删除成功'})
        }
      }
    )
  })

  //维修网点明细====================================完成了！！
  //查询网点详细————完成
  app.get('/repair/app/getSiteList', function (req, res) {
    let siteBean = [];
    let param = {};
    if(req.query.site_property!=undefined){
      param.site_property=req.query.site_property;
    }
    // site
    const getSite = new Promise((resolve, reject) => {
      db.site.find(
        param,
        function (err, doc) {
          if (err) {
            console.log('site find error!');
            reject('reject site')
          } else {
            if (!doc) {
              siteBean = [];
            } else {
              siteBean = doc;
            }
            resolve(siteBean)
          }
        })
    })

    const p_all = Promise.all([getSite])

    p_all.then((suc) => {
      let data = {
        "SiteBean": suc[0]
      }
      res.json({ code: 200, msg: '查询成功', data: data })
      return
    }).catch((err) => {
      console.log('err all:' + err)
      res.json({ code: 600, msg: '查询出错', data: data })
      return
    })

  })
  //增加网点详细————完成
  app.get('/repair/app/addSite', function (req, res) { 
    db.site.create(
      {site_name:req.query.site_name,
      site_property:req.query.site_property},
      function(err,doc){
        if(err){
          res.json({code:700,msg:'添加失败'})
        }else{
          res.json({code:200, msg:'添加成功'})
        }
      }
      )
  })
  //删除网点详细————完成
  app.get('/repair/app/deleteSite', function (req, res) {
    db.site.findByIdAndRemove(
      req.query._id,
      function(err,doc){
        if(err){
          res.json({code:700,msg:'删除失败'})
        }else{
          res.json({code:200,msg:'删除成功'})
        }
      }
    )
  })

  app.get('*', function (req, res) {
    res.end('404')
  })

}