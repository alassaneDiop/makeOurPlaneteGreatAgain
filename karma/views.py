from django.shortcuts import render

# Create your views here.
def karma(request):
	return render(request, "karma.html")
