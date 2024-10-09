;; sequence(s): A174091
;; terms: 2 3 2 3 6 7 6 7 10 11 10 11 14 15 14 15 18 19 18 19
;; small program: (if ((x div 2) mod 2) <= 0 then 2 else 0) + x
;; fast program: loop(0, (x mod (2 + 2)) - 1, 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (modf (divf x 2) 2) 0) 2 0) x))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (modf x (+ 2 2)) 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
