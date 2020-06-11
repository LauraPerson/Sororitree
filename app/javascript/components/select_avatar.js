const cardAvatarHover = () => {
  if ($(".card-avatar")) {
    $(".card-avatar").mouseenter((event) => {
      // Change the style background-image to remove the linea-gradient when hover
      const eventCard = event.currentTarget;
      const cardDisabled = event.currentTarget.style.backgroundImage;
      event.currentTarget.style.backgroundImage = cardDisabled.replace("linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), ", "");
    }).mouseleave((event) => {
      if (event.currentTarget.className != "card-avatar active") {
        const backgroundImage = event.currentTarget.style.backgroundImage;
        const filter = `linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), `;
        const cardDisabled = filter + backgroundImage
        event.currentTarget.style.backgroundImage = cardDisabled;
      }
    })
  }
}

const cardAvatarSelect = () => {
  if ($(".card-avatar")) {
    $('input:checkbox').click(function() {
      // Add this condition not to modify other checkbox than avatar (ex: selected_theme)
      if(this.name.includes("avatar")) {
        $('input:checkbox').not(this).prop('checked', false);
        const label = document.querySelector(`label[for="profile_avatar_avatar_id_${this.value}"]`)
        label.classList.add("active");
        $('label').not(label).attr('class', 'card-avatar');
      }
    });
  }
}

const checkBoxes = (boxes) => {
  let checktrue = false;
  boxes.forEach((box) => {
    if (box.checked === true) {
      checktrue = true;
    };
  });
  return checktrue;
};

const checkBtnAvatar = () => {
  if (document.getElementById("btn-avatar")) {
    const boxes = document.querySelectorAll('input[type=checkbox]');
    const btnAvatar = document.getElementById("btn-avatar");
    const checking = checkBoxes(boxes);
    if ( checking === true ) {
        btnAvatar.disabled = false;
        btnAvatar.classList.remove("disabled");
    } else{
        btnAvatar.disabled = true;
        btnAvatar.classList.add("disabled");
    };
  }
};

const initBtnAvatar = () => {
  if (document.getElementById("btn-avatar")) {
    const btnAvatar = document.getElementById("btn-avatar");
    btnAvatar.disabled = true;
    btnAvatar.classList.add("disabled");
    const boxes = document.querySelectorAll('input[type=checkbox]');
    if (boxes) {
      boxes.forEach((box) => {
        box.addEventListener('click', (event) => {
          checkBtnAvatar();
        });
      });
    };
  };
};


export { cardAvatarHover, cardAvatarSelect, initBtnAvatar };