const bcrypt = require("bcrypt");
const connection = require("../configs/dbConfig");

exports.getAllUsers = (queryPage, queryPerPage, keyword, sortBy, order) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM users WHERE username LIKE ? OR email LIKE ?",
      [`%${keyword}%`, `%${keyword}%`, `%${keyword}%`],
      (err, result) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          totalData = result[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT * FROM users WHERE username LIKE ? OR email LIKE ? ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
          [`%${keyword}%`, `%${keyword}%`, firstData, perPage],
          (err, result) => {
            if (err) {
              reject(new Error("Internal server error"));
            } else {
              resolve([totalData, totalPage, result, page, perPage]);
            }
          }
        );
      }
    );
  });
};

exports.getUsersById = (id) => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM users WHERE id = ?", id, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.createUsers = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      data.email,
      (err, result) => {
        if (result.length > 0) {
          reject(new Error("Email has been registered"));
        } else {
          connection.query("INSERT INTO users SET ?", data, (err, result) => {
            if (!err) {
              connection.query(
                "SELECT * FROM users WHERE id = ?",
                result.insertId,
                (err, result) => {
                  if (!err) {
                    resolve(result);
                  } else {
                    reject(new Error("Internal server error"));
                  }
                }
              );
            } else {
              reject(new Error("Internal server error"));
            }
          });
        }
      }
    );
  });
};

exports.updateUsers = (id, data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      `SELECT * FROM users WHERE NOT id = ? AND email = ?`,
      [id, data.email],
      (err, result) => {
        if (result.length > 0) {
          reject(new Error("Email has been registered"));
        } else {
          connection.query(
            "UPDATE users SET ? WHERE id = ?",
            [data, id],
            (err, result) => {
              if (!err) {
                connection.query(
                  "SELECT * FROM users WHERE id = ?",
                  id,
                  (err, result) => {
                    if (!err) {
                      resolve(result);
                    } else {
                      reject(new Error("Internal server error"));
                    }
                  }
                );
              } else {
                reject(new Error("Internal server error"));
              }
            }
          );
        }
      }
    );
  });
};

exports.deleteUsers = (id) => {
  return new Promise((resolve, reject) => {
    connection.query("DELETE FROM users WHERE id = ?", id, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.findUser = (id, message) => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM users WHERE id = ?", id, (err, result) => {
      if (!err) {
        if (result.length == 1) {
          resolve(result);
        } else {
          reject(new Error(`Cannot ${message} users with id = ${id}`));
        }
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.login = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      data.email,
      (err, result) => {
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          if (result.length === 1) {
            const user = result[0];
            if (result[0].active === 0) {
              reject(new Error("Your account not activated"));
            } else {
              bcrypt.compare(
                data.password,
                result[0].password,
                (err, result) => {
                  if (err) {
                    reject(new Error("Internal server error"));
                  } else {
                    if (result) {
                      resolve(user);
                    } else {
                      reject(new Error("Wrong password"));
                    }
                  }
                }
              );
            }
          } else {
            reject(new Error("Wrong email"));
          }
        }
      }
    );
  });
};

exports.createUsersToken = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO user_token SET ?", data, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.createToken = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO access_token SET ?", data, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.findEmail = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT email FROM users WHERE email = ?",
      email,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.findToken = (token) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT token FROM user_token WHERE token = ?",
      token,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.deleteEmail = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM users WHERE email = ?",
      email,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.deleteToken = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM user_token WHERE email = ?",
      email,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.setActive = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE users SET active = true WHERE email = ?",
      email,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.findAccount = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ? AND active = true",
      data,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.setPassword = (password, email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE users SET password = ? WHERE email = ?",
      [password, email],
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.checkPassword = (password) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT password FROM users WHERE password = ?",
      password,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};
