const router = require('express').Router()
const userController = require('../controllers/userController.js')

router.post('/login', userController.login)
router.post('/register', userController.register)

module.exports = router