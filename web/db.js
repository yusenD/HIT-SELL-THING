const mongoose = require('mongoose')
const Schema = mongoose.Schema

//const DB_URL = 'mongodb://127.0.0.1:27017/repairdb';
const DB_URL = 'mongodb://repairOwner:guhonganfang@127.0.0.1:27017/repairdb'

// 中心的数据结构模型
const centerSchema = new Schema({
    center_name:String
})
// 设备详细--模型
const deviceSchema = new Schema({
    device_name:String
})
// 安装--模型
const installSchema = new Schema({
    time:String,
    center_name:String,
    site_name:String,
    site_person:String,
    install_person:String,
    install_pro:String,
    device:String,
    install_state:String,
    install_complete:Number,
    install_cost:String,
})
// 人员--模型
const personSchema = new Schema({
    nick_name:String,
    account:String,
    password:String,
    limit:Number,
    manage_center:String,
})
// 项目--模型
const projectSchema = new Schema({
    project_name:String,
})

// 维修记录——模型
const repairSchema = new Schema({
  time: String,
  site_name: String,
  repair_pro: String,
  repair_person: String,
  site_person: String,
  center_name: String,
  device:String,
  fix_state:String,
  return_fix:Number,
  fix_cost:String,
  return_time:String,
})
// 网点--模型
const siteSchema = new Schema({
    site_name:String,
    site_property:String,
})

mongoose.set('useFindAndModify', false)
mongoose.Promise = global.Promise;
mongoose.connect(DB_URL,{useNewUrlParser: true});
const database =  mongoose.connection;
database.on('error', function(error){
  console.log('数据库repairdb连接失败：' + error)
  return
})
database.once('open', function(){
  console.log('数据库repairdb连接成功')
  // 初始化数据库
})

const db = {
  center: mongoose.model('centers', centerSchema),
  repair: mongoose.model('repairs', repairSchema),
  device: mongoose.model('devices', deviceSchema),
  install: mongoose.model('installs', installSchema),
  project: mongoose.model('projects', projectSchema),
  site: mongoose.model('sites', siteSchema),
  person: mongoose.model('persons', personSchema),
}

module.exports = db