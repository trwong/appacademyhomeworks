window.setTimeout(function() {
  alert('HAMMERTIME')}, 3000
)

function hammerTime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`)
  }, time)
}
