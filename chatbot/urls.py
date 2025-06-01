import os.path

from django.contrib import admin
from django.urls import include, path

from chatbot import settings
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("chat.urls", namespace="chat")),
]
if settings.DEBUG:
# urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


admin.site.index_title = "Chatbot"
admin.site.site_header = "Chabot Server Admin"
admin.site.site_title = "Chatbot"