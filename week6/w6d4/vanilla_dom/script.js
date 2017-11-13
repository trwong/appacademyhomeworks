document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const addItem = (e) => {
    e.preventDefault();
    let inputData = document.getElementsByClassName('favorite-input')[0].value;
    document.getElementsByClassName('favorite-input')[0].value = "";
    let li = document.createElement("li");
    li.innerHTML = inputData;
    document.getElementById('sf-places').appendChild(li);
  };

  document.getElementsByClassName('favorite-submit')[0].addEventListener('click', addItem);

  // adding new photos

  // --- your code here!

  const toggleHidden = (e) => {
    let photoForm = document.getElementsByClassName('photo-form-container')[0];
    if (photoForm.classList.contains('hidden')) {
      photoForm.classList.remove('hidden');
    }
    else {
      photoForm.className += " hidden";
    }
  };
  document.getElementsByClassName('photo-show-button')[0].addEventListener('click', toggleHidden);


  const addImage = (e) => {
    e.preventDefault();
    let url = document.getElementsByClassName('photo-url-input')[0].value;
    document.getElementsByClassName('photo-url-input')[0].value = "";
    let li = document.createElement("li");
    let img = document.createElement("img");
    img.src = url;

    li.appendChild(img);
    document.getElementsByClassName('dog-photos')[0].appendChild(li);
  };

  document.getElementsByClassName('photo-url-submit')[0].addEventListener('click', addImage);
});
