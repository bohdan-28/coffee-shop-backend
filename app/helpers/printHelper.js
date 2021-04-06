exports.printPaginate = (
  res,
  statusCode,
  message,
  totalData,
  totalPage,
  data,
  currentPage,
  perPage
) => {
  res.status(statusCode).json({
    status: statusCode === 200,
    message,
    totalData,
    totalPage,
    data,
    currentPage,
    perPage,
  });
};

exports.printSuccess = (res, statusCode, message, data) => {
  res.status(statusCode).json({
    status: statusCode === 200,
    message,
    data,
  });
};

exports.printError = (res, statusCode, message) => {
  res.status(statusCode).json({
    status: statusCode === 200,
    message,
  });
};
