document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10, 500, 500);

  ctx.beginPath();
  ctx.arc(255, 255, 245, 0, 2*Math.PI, true);
  ctx.strokeStyle = "orange";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();
});
