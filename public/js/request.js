var host = 'http://jidian.bxiaobao.com'
var jwt = Cookies.get('authorization');
var urls = {
    //获取授权
    'authorization': '/api/authorization',

    //获取课程信息
    'course': '/api/course',
    'getProxySetting': '/api/course/proxy/settings',

    //发起支付
    'postCoursePay': '/api/course/pay',
    'postProxyPay':'/api/course/proxy/pay',

    //获取奖励信息
    'getRelationReward': '/api/relation/reward',
    'getAccount': '/api/account',
    'getReward': '/api/account/reward',
    'getRewardDetail': '/api/account/reward/detail',

    //获取课程奖励
    'getCourseReward': '/api/course/reward',

    //获取jssdk配置
    'postJssdk': '/api/config/jsconfig',

    //获取客服二维码
    'getContactQr': '/api/contact'
}

function request(url, method, data) {
    var path = host + url
    var header = {
        'Authorization': jwt
    }
    if (method == 'post') {
        return axios.post(path, data, {
            headers: header
        })
    }
    if (method == 'patch') {
        return axios.patch(path, data, {
            headers: header
        })
    }
    if (method == 'get') {
        console.log
        return axios.get(path, {
            headers: header,
            params: data
        })
    }
}

function getCourse(data) {
    return request(urls['course'], 'get', data);
}

function postCoursePay(data) {
    return request(urls['postCoursePay'], 'post', data);
}

function postProxyPay(data){
    return request(urls['postProxyPay'], 'post', data);
}

function getRelationReward(){
    return request(urls['getRelationReward'], 'get', {});
}

function getProxySetting(){
    return request(urls['getProxySetting'], 'get', {});
}

function postJssdk(data){
    return request(urls['postJssdk'], 'post', data);
}

function getAccount(){
    return request(urls['getAccount'], 'get', {})
}

function getReward(){
    return request(urls['getReward'], 'get', {})
}

function getCourseReward(data){
    return request(urls['getCourseReward'], 'get', data)
}

function getRewardDetail(data){
    return request(urls['getRewardDetail'], 'get', data)
}

function getContactQr(){
    return request(urls['getContactQr'], 'get', {})
}