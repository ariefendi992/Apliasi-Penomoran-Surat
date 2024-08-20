from django.http import HttpRequest
from django.shortcuts import render

from masterdata.models import KlasifikasiModel
from .forms import *


# Create your views here.
def daftar_suratmasuk_page(request: HttpRequest):

    context = dict(titlepage="Surat Masuk", page="suratmasuk")
    return render(request, "pages/suratmasuk/surat_masuk_page.html", context)


def tambah_suratmasuk_page(request: HttpRequest):

    context = dict(titlepage="Tambah Surat Masuk", page="tambahsuratmasuk")
    return render(request, "pages/suratmasuk/tambah_suratmasuk_page.html", context)


def daftar_suratkeluar_page(request):

    context = dict(titlepage="Surat Keluar", page="suratkeluar")
    return render(request, "pages/suratkeluar/surat_keluar_page.html", context)


def tambah_suratkeluar_page(request: HttpRequest):
    form = FormTambahSuratKeluar()
    klasifikasi_query = KlasifikasiModel.objects.all()

    for i in klasifikasi_query:
        form["klasifikasi"].field.choices += [(i.id, i.klasifikasi_arsip.title())]
    context = dict(
        titlepage="Tambah Surat Keluar",
        page="tambahsuratkeluar",
        form=form,
    )
    return render(request, "pages/suratkeluar/tambah_suratkeluar_page.html", context)
