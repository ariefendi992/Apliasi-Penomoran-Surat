const klasifikasiID = document.getElementById("id_klasifikasi");
const masalahPokokID = document.getElementById("id_masalahPokok");
klasifikasiID.addEventListener("change", (e) => {
  var baseUrl = "{% url 'api:masalahpokok' klasifikasi_id='data_id' %}";
  var url = baseUrl.replace("data_id", klasifikasiID.value);
  fetch(url).then((resp) => {
    resp.json().then((data) => {
      if (data.status === true) {
        data.data.forEach((item) => {
          masalahPokokID.innerHTML += `<option value=${item.id}>${item.kode}</option>`;
        });
      } else {
        masalahPokokID.innerHTML = '<option value="">-- Pilih --</option>';
      }
    });
  });
});

// WINDOW REFRESH
window.onload = () => {
  if (klasifikasiID.value) {
    var baseUrl = "{% url 'api:masalahpokok' klasifikasi_id='data_id' %}";
    var url = baseUrl.replace("data_id", klasifikasiID.value);
    fetch(url).then((resp) => {
      resp.json().then((data) => {
        if (data.status === true) {
          data.data.forEach((item) => {
            masalahPokokID.innerHTML += `<option value=${item.id}>${item.kode}</option>`;
          });
        } else {
          masalahPokokID.innerHTML = '<option value="">-- Pilih --</option>';
        }
      });
    });
  }
};
