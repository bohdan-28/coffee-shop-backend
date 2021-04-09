const Joi = require("joi");

module.exports = {
  validationUsers: (users) => {
    const schema = Joi.object({
      email: Joi.string().email().required(),
      password: Joi.string().min(8).required().strict(),
      phoneNumber: Joi.number().required(),
      username: Joi.string().required(),
      firstname: Joi.string().required(),
      lastname: Joi.string().required(),
      address: Joi.string().required(),
      gender: Joi.string().required(),
      dateOfBirth: Joi.date(),
    });
    return schema.validate(users);
  },
  validationUsersUpdate: (users) => {
    const schema = Joi.object({
      email: Joi.string().email().required(),
      phoneNumber: Joi.number().required(),
      username: Joi.string().required(),
      firstname: Joi.string().required(),
      lastname: Joi.string().required(),
      address: Joi.string().required(),
      gender: Joi.string().required(),
      dateOfBirth: Joi.date(),
    });
    return schema.validate(users);
  },
};
