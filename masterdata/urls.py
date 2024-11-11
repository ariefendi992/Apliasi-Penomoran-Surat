from django.urls import path
from . import views

app_name = "masterdata"

urlpatterns = [path("download/<str:filename>/", views.download_file, name="download")]
