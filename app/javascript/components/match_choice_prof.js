const matchChoiceProf = () => {
  if ($(".matching-card-prof")) {
    $(".matching-card-prof").click((event) => {
      event.currentTarget.classList.toggle("active");
    });
  };
};

export { matchChoiceProf };
