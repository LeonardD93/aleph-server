<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grazie per averci contattato!</title>
</head>

<body>
    <h1>Grazie per averci contattato, {{ $contact['first_name'] }}!</h1>
    <p>Abbiamo ricevuto il tuo messaggio:</p>
    <blockquote>{{ $contact['message'] }}</blockquote>
    <p>Ti contatteremo al più presto al numero di telefono {{ $contact['phone'] }} o all'indirizzo email {{ $contact['email'] }}.</p>
    <p>Grazie,<br>Il nostro team</p>
</body>

</html>