const checkBoxes = (boxes) => {
  let checktrue = false;
  boxes.forEach((box) => {
    if (box.checked === true) {
      checktrue = true;
    };
  });
  console.log(checktrue);
  return checktrue;
};

const checkBtnRequest = () => {
  if (document.getElementById("button-modal-request")) {
    const boxes = document.querySelectorAll('input[type=checkbox]');
    const btnModal = document.getElementById("button-modal-request");
    const checking = checkBoxes(boxes);
    console.log(checking);
    if ( checking === true ) {
        console.log("checkBoxes(boxes) == true ");
        btnModal.disabled = false;
        btnModal.classList.remove("disabled");
    } else{
        console.log("checkBoxes(boxes) == false ");
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
