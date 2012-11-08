# encoding: utf-8
module KnowsHowToUseMessageBoards
  def visit_topic(title)
    visit topic_path topic_titled(title)
  end

  def edit_topic(title)
    visit edit_topic_path topic_titled(title)
  end

  def edit_reply(topic_title, reply)
    visit_topic topic_title
    within "li:contains('#{reply}')" do
      click_link 'Редактирай'
    end
  end

  def topic_titled(title)
    Topic.find_by_title! title
  end
end

module KnowsHowToUseChallenges
  def find_challenge(name)
    @challenge = Challenge.find_by_name!(name)
  end

  def challenge
    @challenge
  end

  def submitted_code
    @submitted_code
  end

  def visit_my_challenge_solution(challenge)
    visit challenge_path(challenge)
    click_on 'Моето решение'
  end

  def create_challenge(name)
    visit new_challenge_path

    fill_in 'Име', with: name
    fill_in 'Краен срок', with: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S')
    click_on 'Създай'
  end

  def submit_challenge_solution(challenge, code = 'arbitrary.ruby.code')
    visit challenge_my_solution_path(challenge)

    fill_in 'Код', with: code
    click_on 'Изпрати'

    @submitted_code = code
  end
end

World(KnowsHowToUseMessageBoards)
World(KnowsHowToUseChallenges)
