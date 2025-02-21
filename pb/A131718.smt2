;; sequence(s): A131718
;; terms: 1 1 2 1 2 1 1 1 2 1 2 1 1 1 2 1 2 1 1 1
;; small program: 2 - ((if (x mod (1 + 2)) <= 0 then 1 else x) mod 2)
;; fast program: loop(y, ((x * x) mod (2 + (2 + 2))) - 2, 1)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 2 (modf (ite (<= (modf x (+ 1 2)) 0) 1 x) 2)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- (modf (* x x) (+ 2 (+ 2 2))) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
