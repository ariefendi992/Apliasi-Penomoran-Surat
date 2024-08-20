from django.http import HttpRequest
from django.shortcuts import render


# Create your views here.
def beranda_page(request: HttpRequest):

    context = dict(titlepage="Beranda", page="beranda")

    return render(request, "pages/beranda_page.html", context)
