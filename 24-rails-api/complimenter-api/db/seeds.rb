# clear out all old, crusty compliments...
Compliment.destroy_all

# create new fresh compliments!
Compliment.create([
  { message: "I bet you make babies smile.", hug_count: 2 },
  { message: "Our time together is like a nap, it never lasts long enough.", hug_count: 42 },
  { message: "When you say, “I meant to do that,” I totally believe you.", hug_count: 3 },
  { message: "Your eyebrows are on fleek.", hug_count: 64 },
  { message: "You’re a great person to do a group project with.", hug_count: 2 },
  { message: "You’re always on time to things, which is awesome because I’m not.", hug_count: 0 },
  { message: "Looking like a complete idiot with you is really fun.", hug_count: 1 },
  { message: "Being alone is kind of nice. Being alone with you is better.", hug_count: 64 },
  { message: "I would hang out with you even if you hadn’t showered for a couple days.", hug_count: 0 },
  { message: "I would go on an 18 hour road trip with you, I like you that much.", hug_count: 2 },
  { message: "Out of all the strangers I meet on a daily basis, I’m glad you’re one of those strangers that became my friend.", hug_count: 0 },
  { message: "You’re that “Nothing” when people ask me what I’m thinking about.", hug_count: 64 },
  { message: "You’re more fun than a ball pit filled with candy. (And seriously, what could be more fun than that?)", hug_count: 2 },
  { message: "I like your outfit so much that if I wore it on the same day as you I wouldn’t even be embarrassed, we’d just be that stylish.", hug_count: 66 },
  { message: "You’re even better than a unicorn, because you’re real.", hug_count: 0 },
  { message: "I would be really okay with you seeing me without makeup, that’s how much I like you.", hug_count: 97 },
  { message: "You have really good taste in friends (i.e. me).", hug_count: 0 },
  { message: "You have a really contagious laugh. See, now I’m laughing and it's all your fault.", hug_count: 83 }
])