module CustomPaths
  def solution_path(solution)
    task_solution_path(solution.task, solution)
  end

  def solution_url(solution)
    task_solution_url(solution.task, solution)
  end

  def comment_path(comment)
    task_solution_url(comment.solution.task, comment.solution, anchor: "comment-#{comment.id}")
  end

  def comment_url(comment)
    task_solution_url(comment.solution.task, comment.solution, anchor: "comment-#{comment.id}")
  end

  def user_path(user)
    if user.admin?
      teacher_path(user)
    else
      student_path(user)
    end
  end

  def user_url(user)
    if user.admin?
      teacher_url(user)
    else
      student_url(user)
    end
  end
end
