from django.urls import path
from .views import *

app_name = "suratmasuk"
urlpatterns = [
    path("surat-masuk/", daftar_suratmasuk_page, name="daftarsuratmasuk"),
    path("surat-masuk/tambah-data", tambah_suratmasuk_page, name="tambahsuratmasuk"),
]
