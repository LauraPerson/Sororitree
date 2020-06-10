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
    $(".card-avatar").click((event) => {
      event.currentTarget.classList.toggle("active");
    })
  }
}


export { cardAvatarHover, cardAvatarSelect };