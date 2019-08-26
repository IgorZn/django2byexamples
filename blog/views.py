from django.shortcuts import render, get_object_or_404
from .models import Post
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView
from .forms import EmailPostForm

# Create your views here.


def post_share(request, post_id):
    # Get post by id
    post = get_object_or_404(Post, id=post_id, status='published')
    if request.method == 'POST':
        form = EmailPostForm(request.POST)
        if form.is_valid():
            # All fields are valid
            cd = form.cleaned_data
            # send email
        else:
            form = EmailPostForm()
            # Return form
            return render(request, 'blog/post/list.html', {'post': post, 'form': form})

class PostListView(ListView):
    queryset = Post.published.all()
    context_object_name = 'posts'
    paginate_by = 3
    template_name = 'blog/post/list.html'


def post_list(request):
    object_list = Post.published.all()
    paginator = Paginator(object_list, 3)
    page = request.GET.get('page')
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # If page not , return first page
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)

    return render(request, 'blog/post/list.html', {'page': page, 'posts': posts,})


def post_detail(request, year, month, day, post):
    post = get_object_or_404(
        Post,
        slug=post,
        status='published',
        published__year=year,
        published__month=month,
        published__day=day
    )
    return render(request, 'blog/post/detail.html', {'post': post})
