// 编辑名片表单校验
$(function(){
	$('#saveCard').bootstrapValidator({
        message: '输入信息不合法',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'cardInfo.name': {
                message: '姓名输入不合法',
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '姓名长度要小于30'
                    }
                }
            },
            'cardInfo.email': {
            	message: '邮箱输入不合法',
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '邮箱不合法'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '邮箱长度要小于30'
                    }
                }
            },
            'cardInfo.company': {
            	message: '公司输入不合法',
                validators: {
                    notEmpty: {
                        message: '公司不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '公司长度要小于30'
                    }
                }
            },
            'cardInfo.position': {
            	message: '工作职务不合法',
                validators: {
                    notEmpty: {
                        message: '工作职务不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '工作职务长度要小于30'
                    }
                }
            },
            'cardInfo.phone': {
            	message: '手机输入不合法',
                validators: {
                    notEmpty: {
                        message: '手机不能为空'
                    },
                    regexp:{
                    	regexp: /^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/,
                    	message: '手机号输入不合法'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '手机号长度要小于30'
                    }
                }
            },
            'cardInfo.qq': {
            	message: 'QQ号输入不合法',
                validators: {
                    regexp:{
                    	regexp: /^[1-9][0-9]{4,9}$/,
                    	message: 'QQ号输入不合法'
                    }
                }
            },
            'cardInfo.wechatnumber': {
            	message: '微信号输入不合法',
                validators: {
                    regexp:{
                    	regexp: /^[a-zA-Z\d_]{5,}$/,
                    	message: '微信号输入不合法'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '微信号长度要小于30'
                    }
                }
            },
            'cardInfo.site': {
            	message: '公司网址输入不合法',
                validators: {
                    regexp:{
                    	regexp: /^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/,
                    	message: '公司网址输入不合法'
                    },
                    stringLength: {
                        min: 1,
                        max: 200,
                        message: '公司网址长度要小于200'
                    }
                }
            },
            'cardInfo.fax': {
            	message: '传真输入不合法',
                validators: {
                    regexp:{
                    	regexp: /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/,
                    	message: '传真输入不合法'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: '传真长度要小于30'
                    }
                }
            },
            'cardInfo.address': {
            	message: '地址输入不合法',
                validators: {
                    stringLength: {
                        min: 1,
                        max: 200,
                        message: '地址长度要小于200'
                    }
                }
            }
        }
	});
});	