import ast
from django.http import HttpRequest
from django.shortcuts import redirect, render
from .forms import SuratMasukForm
from .models import SuratMasukModel


# Create your views here.
def daftar_suratmasuk_page(request: HttpRequest):

    query = SuratMasukModel.objects.all()
    data = []
    for i in query:
        filename = f"{i.file}".split("surat_masuk/")
        reverse_filename = "surat_masuk\\".join(filename)
        data.append(
            {
                "tgl": i.tgl_surat,
                "noSurat": ast.literal_eval(i.no_surat)[0],
                "hal": i.hal,
                "doc": reverse_filename,
            }
        )

    context = dict(
        titlepage="Surat Masuk",
        page="suratmasuk",
        data=data,
    )
    return render(request, "pages/suratmasuk/surat_masuk_page.html", context)


def tambah_suratmasuk_page(request: HttpRequest):
    form = SuratMasukForm()

    if request.method == "POST":
        hal = request.POST["hal"]
        no_surat = request.POST["noSurat"]
        tgl_surat = request.POST["tglSurat"]
        file = request.FILES["lampiran"]

        # ext = file.name.split(".")[-1]
        # dt = datetime.now()
        # time = f"{dt.second}{dt.minute}{dt.hour}"
        # date = f"{dt.day}{dt.month}{dt.year}"
        # filename = f"sm_{time}_{date}_{no_surat}.{ext}"
        # path_file = os.path.join(MEDIA_ROOT, filename)

        data = SuratMasukModel(
            no_surat=f"{no_surat}",
            tgl_surat=tgl_surat,
            hal=hal,
            file=file,
        )

        print(f"No Surat : {no_surat}")

        data.save()

        return redirect("suratmasuk:daftarsuratmasuk")

    context = dict(
        titlepage="Tambah Surat Masuk",
        page="suratmasuk",
        form=form,
    )
    return render(request, "pages/suratmasuk/tambah_suratmasuk_page.html", context)
