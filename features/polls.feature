# language: bg
Функционалност: Новини
  За да може студентите да знаят какво се случва в курса
  като преподавателски екип
  искаме да можем да публикуваме новини на сайта

  Сценарий: Отговаряне на анкета
    Дадено че съм студент
    И че съществува анкета "Общи въпроси":
      """
      - name: language
        text: Кой е основния ви език за програмиране?
        type: single-line
      - name: editor
        text: Какъв текстов редактор ползвате?
        type: single-line
      """
    Когато попълня анкетата "Общи въпроси" с:
      | Въпрос                                  | Отговор |
      | Кой е основния ви език за програмиране? | Ruby    |
      | Какъв текстов редактор ползвате?        | Vim     |
    То трябва да бъдат записани следните отговори на "Общи въпроси":
      """
      language: Ruby
      editor: Vim
      """

  Сценарий: Редактиране на отговор на анкета
    Дадено че съм студент
    И че съществува анкета "Общи въпроси":
      """
      - name: language
        text: Кой е основния ви език за програмиране?
        type: single-line
      - name: editor
        text: Какъв текстов редактор ползвате?
        type: single-line
      """
    И че съм отговорил на анкетата "Общи въпроси" с:
      """
      language: Ruby
      editor: Vim
      """
    Когато попълня анкетата "Общи въпроси" с:
      | Въпрос                                  | Отговор |
      | Какъв текстов редактор ползвате?        | Emacs   |
    То трябва да бъдат записани следните отговори на "Общи въпроси":
      """
      language: Ruby
      editor: Emacs
      """
