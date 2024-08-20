from django.shortcuts import render
from django.http import HttpRequest, JsonResponse
from masterdata.models import *


# Create your views here.
def tes_data_api(request):

    data = {"id": 1, "nana": "Ok"}

    return JsonResponse(data=data, safe=False)


def get_maslah_pokok(request, klasifikasi_id):
    masalah_pokok = MasalahPokokModel.objects.filter(klasifikasi=klasifikasi_id)

    if not masalah_pokok:
        data = {"status": False, "data": "Tidak diketahui"}

        return JsonResponse(data=data, status=200, safe=False)
    else:
        group_data = {"status": True, "data": []}
        for i in masalah_pokok:
            group_data["data"].append(
                {
                    "id": i.id,
                    "kode": i.kode,
                    "masalah_pokok": i.masalah_pokok,
                }
            )

        return JsonResponse(data=group_data, safe=False, status=200)


def get_bagian_masalah(request):
    masalah_pokok_id = request.GET.get("q")

    bagian_masalah = BagianMasalahModel.objects.filter(
        masalahpokok=masalah_pokok_id
    ).all()

    if not bagian_masalah:
        data = {
            "status": False,
            "msg": "Data tidak diketahui!",
            "data": None,
        }
        return JsonResponse(data=data)

    else:
        group_data = {
            "status": True,
            "msg": "Data ada",
            "data": [],
        }

        for i in bagian_masalah:
            group_data["data"].append(
                {
                    "id": i.id,
                    "kode": i.kode,
                    "bagian_masalah": i.bagian_masalah.title(),
                }
            )

        return JsonResponse(data=group_data, status=200)
