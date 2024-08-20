from django.urls import path
from .views import beranda_page

app_name = "beranda"
urlpatterns = [
    path("", beranda_page, name="berandapage"),
]
