binSearch<- function(arr, item)
{
  pos<- -1
  mid <- 0
  l <- 1
  u <- length(arr)
  
  while(l<=u)
  {
    mid <- as.integer((l+u)/2)
    if(arr[mid]==item)
    {
      pos<- mid
      break
    }
    else if(arr[mid]>item)
    {
      u <- mid-1
    }
    else
    {
      l <- mid+1
    }
  }
  if(pos!=-1)
  {
    print(paste("Element found at",pos),quote = FALSE)
  }
  else
  {
    print("Element not found",quote=FALSE)
    
  }
}

binSearch(c(10,20,30,40,50,60),40)