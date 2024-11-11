from django.http import FileResponse, Http404, HttpRequest
import os


def download_file(request: HttpRequest, filename: str):
    file_path = os.path.join("media", "filename")
    if os.path.exists(file_path):
        resp = FileResponse(open(file_path, "rb"), as_attachment=True)
        return resp
    else:
        raise Http404("File tidak ditemukan.")
