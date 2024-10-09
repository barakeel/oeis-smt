;; sequence(s): A348232
;; terms: 1 9 25 53 85 133 181 249 313 401 481 589 685 813 925 1073 1201 1369 1513 1701
;; small program: ((loop(x + y, (x - 1) div 2, x) + (x * x)) * (2 + 2)) + 1
;; fast program: ((loop((2 + x) * x, 1, (x + x) + x) div 2) + 1) + ((x mod 2) * x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (divf (- x 1) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (v0 x) (* x x)) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 2 x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (+ x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (v1 x) 2) 1) (* (modf x 2) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
