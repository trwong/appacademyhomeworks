module.exports = {
  entry: "./entry.jsx",
  output: {
      filename: "bundle.js"
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
};
