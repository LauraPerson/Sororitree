const matchChoice = () => {
  if ($(".matching-card")) {
    $(".matching-card").click((event) => {
      event.currentTarget.classList.toggle("active");
    });
  };
};

export { matchChoice };
