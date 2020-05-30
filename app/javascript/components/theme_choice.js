const themeChoice = () => {
  if ($(".theme-choice")) {
    $(".theme-choice").click((event) => {
      event.currentTarget.classList.toggle("active");
    });
  };
};

export { themeChoice };
