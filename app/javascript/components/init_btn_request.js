const checkBoxes = (boxes) => {
  let checktrue = false;
  boxes.forEach((box) => {
    if (box.checked === true) {
      checktrue = true;
    };
  });
  return checktrue;
};

const checkBtnRequest = () => {
  if (document.getElementById("button-modal-request")) {
    const boxes = document.querySelectorAll('input[type=checkbox]');
    const btnModal = document.getElementById("button-modal-request");
    const checking = checkBoxes(boxes);
    if ( checking === true ) {
        btnModal.disabled = false;
        btnModal.classList.remove("disabled");
    } else{
        btnModal.disabled = true;
        btnModal.classList.add("disabled");
    };
  }
};

const initBtnRequest = () => {
  const boxes = document.querySelectorAll('input[type=checkbox]');
  if (boxes) {
    boxes.forEach((box) => {
      box.addEventListener('click', (event) => {
        checkBtnRequest();
      });
    });
  };
};

export { initBtnRequest };
