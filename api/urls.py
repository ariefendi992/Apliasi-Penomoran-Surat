from django.urls import path
from .views import *

app_name = "api"
urlpatterns = [
    path("test-data", tes_data_api, name="testapi"),
    path(
        "masalah-pokok/results/<klasifikasi_id>",
        get_maslah_pokok,
        name="masalahpokok",
    ),
    path(
        "bagian-masalah/results/",
        get_bagian_masalah,
        name="bagianmasalah",
    ),
    path('suku-masalah/results/', get_suku_masalah, name='sukumasalah'),
    path('kode-balai', get_kode_balai, name='balai')
]
