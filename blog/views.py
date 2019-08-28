from django.shortcuts import render, get_object_or_404
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView

from .models import Post, Comment
from .forms import EmailPostForm, CommentForm

# Create your views here.


def post_detail(request, year, month, day, post):
    post = get_object_or_404(
        Post,
        slug=post,
        status='published',
        publish__year=year,
        publish__month=month,
        publish__day=day
    )

    # List of active comments for particular post
    comments = post.comments.filter(active=True)
    new_comment = None

    if request.method == 'POST':
        # user has been sent comment
        comment_form = CommentForm(data=request.POST)

        if comment_form.is_valid():

            # create comment, but dont save for a while
            new_comment = comment_form.save(commit=False)

            # link comment to current post
            new_comment.post = post

            # save comment in to DB
            new_comment.save()

    else:
        comment_form = CommentForm()

    return render(request, 'blog/post/detail.html', {'post': post,
                                                     'comments': comments,
                                                     'new_comment': new_comment,
                                                     'comment_form': comment_form})


def post_share(request, post_id):
    # Get post by id
    post = get_object_or_404(Post, id=post_id, status='published')
    sent = False

    if request.method == 'POST':
        form = EmailPostForm(request.POST)
        if form.is_valid():
            # All fields are valid
            cd = form.cleaned_data
            # send email
            post_url = request.build_absolute_uri(post.get_absolute_url())
            subject = f"{cd['name']} ({cd['email']}) recomends you reading {post.title}"
            message = f"Read {post.title} at {post_url}\n\n{cd['name']}\'s comments: {cd['comments']}"

            send_mail(
                subject,
                message,
                'igor.znamensky@gmail.com',
                [cd['to']],
            )
            sent = True

    else:
        form = EmailPostForm()
        # Return form

    return render(request, 'blog/post/share.html', {'post': post, 'form': form, 'sent': sent})


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

    return render(request, 'blog/post/list.html', {'page': page, 'posts': posts})


