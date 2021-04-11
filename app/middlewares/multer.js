const multer = require("multer");

const fileStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./images");
  },
  filename: (req, file, cb) => {
    cb(null, "/" + new Date().getTime() + "-" + file.originalname);
  },
});

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/jpeg"
  ) {
    cb(null, true);
  } else {
    const err = new Error("Uploaded file must be png, jpg or jpeg file");
    cb(err, false);
  }
};

const upload = multer({
  storage: fileStorage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 2000000,
  },
});

module.exports = {
  uploadImage: upload,
};
