;; sequence(s): A163434
;; terms: 0 1 70 425 1426 3577 7526 14065 24130 38801 59302 87001 123410 170185 229126 302177 391426 499105 627590 779401
;; small program: loop(((y div 2) + y) * y, (2 * (x * x)) - 1, x)
;; fast program: loop((((x - (if x <= 0 then 0 else 2)) + x) + x) * ((x - 1) + x), 1, x * x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (divf y 2) y) y))))
(assert (forall ((x Int)) (= (g0 x) (- (* 2 (* x x)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (+ (+ (- x (ite (<= x 0) 0 2)) x) x) (+ (- x 1) x)))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
