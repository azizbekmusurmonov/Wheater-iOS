

import pyttsx3 # pyttsx3 - pythonda NLP boyicha kutubxonasi



# Matnni talafuz qiluvchi funksiya

def talk(my_text):
    engine = pyttsx3.init()
    engine.setProperty('rate', 108)

    voices = engine.getProperty('voices')

    engine.setProperty('voice', voices[2].id)
    engine.say(my_text)

    engine.runAndWait()

    my_entry.delete(0,END)



