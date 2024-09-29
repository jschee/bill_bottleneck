import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["upvote", "downvote"]

  connect() {
    const cookieValue = document.cookie.split('; ').find(row => row.startsWith(`bill_post_${this.billPostIdValue}_vote=`));

    if (cookieValue) {
      const voteType = cookieValue.split('=')[1];


      if (voteType === "up_vote") {
        this.upvoteTarget.classList.add("voted");
      }

      if (voteType === "down_vote") {
        this.downvoteTarget.classList.add("voted");
      }
    }
  }

  // vote(event) {
  //   const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');          
  //   const url = this.urlValue;
  //   const button = event.currentTarget
  //   const voteType = button.dataset.voteType
  //   const billPostId = button.dataset.billPostId
  //   const payLoad = { vote_type: voteType,
  //                     bill_post_id: billPostId };

  //   fetch(url, {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'X-CSRF-Token': csrfToken      
  //     },
  //     body: JSON.stringify({ vote: payLoad })
  //   })
  //   .catch(error => {
  //     console.error('Error:', error);
  //   });
  // }
}