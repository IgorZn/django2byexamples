from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import ImageCreateForm

# Create your views here.

@login_required
def image_create(request):
    if request.method == 'POST':
        # Форма отправлена
        form = ImageCreateForm(data=request.POST)
        if form.is_valid():
            cd = form.cleaned_data

            new_item = form.save(commit=False)
            # добавляем пользователя к созданному объекту
            new_item.user = request.user
            new_item.save()
            messages.success(request, 'Image added successfully')
            return redirect(new_item.get_absolute_url())

    form = ImageCreateForm(data=request.GET)
    context = {'section': 'images', 'form': form}
    return render(request, 'images/image/create.html', context)
