from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import UserModel


# Register your models here.
class UserAdmin(BaseUserAdmin):
    list_display = ["username", "nama", "is_active"]
    fieldsets = [
        (None, {"fields": ["username", "password"]}),
        (
            "Personal Info",
            {
                "fields": ["nama"],
            },
        ),
    ]

    add_fieldsets = [
        (None, {"fields": ["username", "password1", "password2"]}),
    ]


admin.site.register(UserModel)
