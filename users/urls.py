from django.urls import path

from knox.views import LogoutView

from .views import UserAPIView, RegisterAPIView, LoginAPIView, post_coins, ListUserAPIView


urlpatterns = [
    path('user', UserAPIView.as_view()),
    path('user_list', ListUserAPIView.as_view()),
    path('register', RegisterAPIView.as_view()),
    path('login', LoginAPIView.as_view()),
    path('logout', LogoutView.as_view(), name='knox_logout'),
    path('transfer_coins/<int:pk>/<int:coins>/', post_coins),
]