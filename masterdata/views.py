from django.http import HttpRequest, FileResponse, Http404
from django.shortcuts import render
import os


# Create your views here.
def download_file(request: HttpRequest, filename):
    file_path = os.path.join("media", filename)
    if os.path.exists(file_path):
        resp = FileResponse(open(file_path, "rb"), as_attachment=True)
        return resp
    else:
        raise Http404("File tidak ditemukan.")
