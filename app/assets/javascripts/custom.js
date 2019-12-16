function submitFrmAjax() {
  Rails.ajax({
    url: "/jobs",
    type: "GET",
    data: $("#get_search").serialize()
  });
}