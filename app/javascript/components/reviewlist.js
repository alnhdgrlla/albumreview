function reviewAjax(){
  const reviewList = document.querySelectorAll('#review-list li');
  const reviewContent = document.querySelector('#review_content');
  const reviewBtn = document.querySelector('#review-btn');

  reviewBtn.addEventListner('click', function(){
    //create an LI
    const newLi = document.createElement('LI');
    const liContent = document.createTextNode(reviewContent.value);
    //add input value into the new LI
    newLi.appendChild(liContent);
    //attaching the new LI to the reviewList
    reviewList.appendChild(newLi);
  });
};

export {reviewAjax};


