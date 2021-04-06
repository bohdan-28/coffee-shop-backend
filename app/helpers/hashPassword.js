const bcrypt = require("bcrypt");

const hashPassword = (password) => {
  return new Promise((resolve, reject) => {
    bcrypt.genSalt(10, (err, salt) => {
      bcrypt.hash(password, salt, (err, hash) => {
        if (!err) {
          resolve(hash);
        } else {
          reject(new Error("Internal server error"));
        }
      });
    });
  });
};

module.exports = {
  hashPassword,
};
