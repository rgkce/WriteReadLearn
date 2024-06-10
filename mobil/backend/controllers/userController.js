const User = require('../models/users')
const bcrypt = require('bcrypt')
const config = require('../config/config')


const login = async (req,res) => {
    console.log(req.body);
    let username = req.body.username;
    let password = req.body.password;

    if(username == "" || password == "")
    {
        res.json({
            status: "FAILED",
            message: "Boş yerleri doldurunuz."
        })
    }else{
        await User.find({username})
        .then(data => {
            if(data){
                const hashedPW = data[0].password;
                bcrypt.compare(password, hashedPW)
                .then(result => {
                    if(result){
                        res.json({
                            status: "SUCCESS",
                            message: "Başarıyla giriş yapıldı.",
                            id: data[0]._id,
                            name: data[0].name
                        })
                    }else{
                        res.json({
                            status: "FAILED",
                            message: "Girdiğiniz şifre yanlış. Tekrar deneyiniz."
                        })
                    }
                }).catch(err => {
                    res.json({
                        status: "FAILED",
                        message: "Sistemsel bir hata oluştu. Tekrar deneyiniz."
                    })
                })
            }
        })
        .catch(err => {
            res.json({
                status: "FAILED",
                message: "Geçersiz kullanıcı adı girdiniz."
            })
        })
    }
}


const register = async (req,res) => {
    console.log(req.body);
    let {name,surname,email,username,password} = req.body;

    if(name == "" || surname == "" || email == "" || username == "" || password == "")
    {
        res.json({
            status: "FAILED",
            message: "Bos yerleri doldurunuz."
        })
    }else{
        await User.find({username})
        .then(result => {
            if(result.length){
                res.json({
                    status: "FAILED",
                    message: "Bu kullanıcı adı sistemde kayıtlı. Farklı bir kullanıcı adı deneyin."
                })
            }
            else{
                const secret = 10;
                bcrypt.hash(password,secret)
                .then(hashedPW => {
                    const user = new User({
                        name,
                        surname,
                        email,
                        username,
                        password: hashedPW
                    })
                    user.save()
                    .then(result => {
                        res.json({
                            status: "SUCCESS",
                            message: "Kayıt işlemi başarıyla tamamlandı.",
                            data: result
                        })
                    })
                    .catch(err => {
                        res.json({
                            status: "FAILED",
                            message: "Kayıt olunurken bir hata oluştu."
                        })
                    })
                })
                .catch(err => {
                    res.json({
                        status: "FAILED",
                        message: "Sistemsel bir hata oluştu. Tekrar deneyiniz."
                    })
                })
            }
        })
        .catch(err => {
            console.log(err);
            res.json({
                status: "FAILED",
                message: "Username aranirken bir hata olustu."
            })
        })
    }
}


module.exports = {
    login,
    register,
}